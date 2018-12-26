import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class tp13 {
    public static void main (String[] args) {
        tp13 c = new tp13();
        System.out.println(c.strToInt());
        System.out.println(c.sort());
        c.printMoreThanThree();
        System.out.println(c.thousandSum());
        System.out.println(c.seteB());
    }

    public <A, B> List<B> listMap (Function<A, B> f, List<A> list) {
        // 4 a
        return list.stream()
                .map(f)
                .collect(Collectors.toList());
    }

    public List strToInt () {
        List<String> lst = Arrays.asList("1", "2", "3");
        return listMap(Integer::parseInt, lst);
    }

    public List sort () {
        List<String> lst = new ArrayList<>();
        lst.add("dd");
        lst.add("b");
        lst.add("c");
        lst.sort((a,b) -> a.length() - b.length());
        return lst;
    }

    public <T, U> void processarElementos (Iterable<T> iter, Predicate<T> p, Function<T, U> f, Consumer<U> consumer) {
        List<T> lst = new ArrayList<>();
        for (T el : iter) {
            if (p.test(el)) {
                consumer.accept(f.apply(el));
            }
        }
    }

    public void printMoreThanThree() {
        List<String> lst = new ArrayList<>();
        lst.add("adsdas");
        lst.add("2");
        lst.add("caubasyidn");
        this.processarElementos(lst, x -> x.length() > 3, String::toUpperCase, System.out::println);
    }

    public int thousandSum() {
        List<Integer> lst = new ArrayList<>();
        for (int i = 0; i < 1001; i++) {
            lst.add(i);
        }
        return lst.stream()
                  .filter(x -> x % 3 == 0 && x % 5 == 1)
                  .reduce(0, (acc, x) -> acc + x);
    }

    public int thousandSumTwo() {
        return Stream.iterate(0, n -> n + 1)
                     .limit(1000)
                     .filter(x -> x % 3 == 0)
                     .filter(x -> x % 5 == 1)
                     .reduce(0, (acc, x) -> acc + x);
    }

    public List<Double> seteB () {
        List<Integer> lst = new ArrayList<>();
        for (int i = -10; i < 5; i++) {
            lst.add(i);
        }
        return lst.stream()
                  .filter(x -> x % 3 == 0)
                  .map(x -> Math.pow(x, 2))
                  .sorted()
                  .distinct()
                  .collect(Collectors.toList());

    }
}
